'use client';

import { yupResolver } from '@hookform/resolvers/yup';
import { useForm } from 'react-hook-form';
import { toast } from 'sonner';
import * as y from 'yup';

import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form';
import { PasswordInput } from '@/components/ui/password-input';

const passwordChangeSchema = y.object().shape({
  oldPassword: y.string().required('This field is required'),
  newPassword: y.string().required('This field is required'),
  confirmNewPassword: y
    .string()
    .required('This field is required')
    .oneOf([y.ref('newPassword')], 'Passwords must match'),
});

export function ChangePassword() {
  const form = useForm<y.InferType<typeof passwordChangeSchema>>({
    resolver: yupResolver(passwordChangeSchema),
    defaultValues: { oldPassword: '', newPassword: '', confirmNewPassword: '' },
  });

  function onSubmit(values: y.InferType<typeof passwordChangeSchema>) {
    toast.success('Your password was changed successfully.');
  }

  return (
    <Form {...form}>
      <form
        id="password"
        onSubmit={form.handleSubmit(onSubmit)}
        className="grid grid-cols-6 gap-2"
      >
        <FormField
          control={form.control}
          name="oldPassword"
          render={({ field }) => (
            <FormItem className="col-span-1">
              <FormLabel>Current Password</FormLabel>
              <FormControl>
                <PasswordInput {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <div className="col-span-3" />
        <FormField
          control={form.control}
          name="newPassword"
          render={({ field }) => (
            <FormItem className="col-span-1">
              <FormLabel>New Password</FormLabel>
              <FormControl>
                <PasswordInput {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="confirmNewPassword"
          render={({ field }) => (
            <FormItem className="col-span-1">
              <FormLabel>Confirm New Password</FormLabel>
              <FormControl>
                <PasswordInput {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
      </form>
    </Form>
  );
}
